import prisma from '$lib/prisma';

/** @type {import('./$types').PageServerLoad} */

export async function load({ locals }) {
	const session = await locals.getSession();
	console.log(session);
	if (!session?.user) {
		return {
			redirect: '/'
		};
	}
}

/** @type {import('./$types').Actions} */
export const actions = {
	default: async ({ cookies, request, locals }) => {
		let session = await locals.getSession();
		const data = await request.formData();
		let skills = data.getAll('default_skills').map((skill) => {
			return { skill_id: skill };
		});
		console.log(skills);

		try {
			await prisma.survey_groups.create({
				data: {
					opportunity_id: data.get('opportunity_id'),
					project_creator_id: data.get('project_creator_id'),
					project_name: data.get('project_name'),
					tsm_id: data.get('tsm_id'),
					disabled: false,
					created_by: data.get('project_creator_id'),
					modified_by: session?.user?.email,
					project_code: data.get('project_code'),
					default_survey_skills: { create: skills },
					employee_assignments: { create: [{ employee_id: 'prmanager' }] }
				}
			});
		} catch (err) {
			console.error(err);
			return { error: err };
		}

		return { success: true };
	}
};

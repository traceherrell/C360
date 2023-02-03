import prisma from '$lib/prisma';

export const load = async ({ locals }) => {
	const session = await locals.getSession();
	if (!session?.user) {
		return {
			redirect: '/'
		};
	}
	// lookup survey groups for this user
	const surveyGroups = await prisma.survey_groups.findMany({
		where: {
			project_creator_id: session?.user?.email
		}
	});
	console.log(surveyGroups);
	return {
		surveyGroups
	};
};

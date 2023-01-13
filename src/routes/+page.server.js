import prisma from '$lib/prisma';

/** @type {import('./$types').PageServerLoad} */
export async function load({ locals }) {
	// get survey groups from the logged in user
	const session = await locals.getSession();
	console.log(session);
	const employee = await prisma.employees.findUnique({
		where: {
			email: session?.user?.email || ''
		},
		include: {
			employee_assignments: {
				include: { survey_groups: true }
			}
		}
	});
	console.log(employee?.employee_assignments[0].survey_groups);
	return {
		employee: employee
	};
}

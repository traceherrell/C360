import { PrismaClient } from '@prisma/client';
import fs from 'fs';

const prisma = new PrismaClient();
const DAY_MILISECONDS = 1000 * 60 * 60 * 24;

async function main() {
	const file = fs.readFileSync('skills.json', 'utf8');
	const skills = JSON.parse(file);

	await prisma.skills.createMany({
		data: skills,
		skipDuplicates: true
	});

	const prmanager = await prisma.employees.upsert({
		where: { email: 'prmanager@redhat.com' },
		update: {},
		create: {
			email: 'prmanager@redhat.com',
			name: 'Pam Manager',
			role: 'Project Manager',
			id: 'prmanager'
		}
	});

	const surveyGroup = await prisma.survey_groups.create({
		data: {
			opportunity_id: 'opportunity1',
			project_creator_id: prmanager.id,
			project_name: 'Red Hat',
			tsm_id: 'tsm1',
			disabled: false,
			created_by: prmanager.id,
			modified_by: prmanager.id,
			project_code: 'RH',
			default_survey_skills: {
				create: [
					{
						skill_id: 'db49f1eb-41f3-4408-86d7-c6a030091946'
					},
					{
						skill_id: '4e95b0d7-3d17-4266-9815-a051beebd63c'
					},
					{
						skill_id: '3dc25edb-20e2-4f25-8934-3ae872208a05'
					},
					{
						skill_id: '0419d377-6af1-4120-b707-81b9d3291c99'
					}
				]
			},
			employee_assignments: {
				create: {
					employee_id: prmanager.id,
					billable_role: 'Project Manager',
					start_date: new Date('1/1/2022').toISOString(),
					end_date: new Date('12/31/2022').toISOString()
				}
			}
		}
	});

	console.log({ prmanager, surveyGroup });
}
main()
	.then(async () => {
		await prisma.$disconnect();
	})
	.catch(async (e) => {
		console.error(e);
		await prisma.$disconnect();
		process.exit(1);
	});

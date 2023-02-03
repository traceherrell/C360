import prisma from '$lib/prisma';
import { json } from '@sveltejs/kit';

export const GET = async ({ url }) => {
	const name = url.searchParams.get('name');

	if (!name || name.length < 3) {
		return json([]);
	}

	const employees = await prisma.employees.findMany({
		where: { name: { contains: name, mode: 'insensitive' } },
		select: { id: true, name: true, email: true, role: true }
	});

	return json(employees);
};

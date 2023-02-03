import prisma from '$lib/prisma';
import { json } from '@sveltejs/kit';

export const GET = async ({ url }) => {
	const param = url.searchParams.get('q');
	if (!param) {
		return json([]);
	}

	const skills = await prisma.skills.findMany({
		where: { skill: { contains: param, mode: 'insensitive' }, active: true },
		select: { skill: true, id: true }
	});

	return json(skills);
};

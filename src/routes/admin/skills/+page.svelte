<script>
	let skills = [
		{ id: 1, name: 'HTML', level: 5 },
		{ id: 2, name: 'CSS', level: 5 },
		{ id: 3, name: 'JavaScript', level: 5 }
	];
	let editSkill = (id) => {
		console.log('edit skill', id);
	};
	let deleteSkill = (id) => {
		console.log('delete skill', id);
	};
</script>

<table>
	<thead>
		<tr>
			<th scope="col">Id</th>
			<th scope="col">Name</th>
			<th scope="col">Level</th>
			<th scope="col">Actions</th>
		</tr>
	</thead>
	<tbody>
		{#each skills as skill}
			<tr>
				<td>{skill.id}</td>
				<td>{skill.name}</td>
				<td>{skill.level}</td>
				<td />
			</tr>
		{/each}
	</tbody>
</table>

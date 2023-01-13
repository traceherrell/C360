<script>
	import { signIn, signOut } from '@auth/sveltekit/client';
	import { page } from '$app/stores';
	const assignments = $page.data.employee.employee_assignments;
</script>

<h1>Surveys</h1>
<p>
	{#if $page.data.session}
		<span class="signedInText">
			<small>Signed in as</small><br />
			<strong>{$page.data.session.user?.name ?? 'User'}</strong>
		</span>

		{#if assignments.length > 0}
			{#each assignments as assignment}
				<div>
					{assignment.survey_groups.project_name}
				</div>
			{/each}
		{:else}
			<div>No surveys assigned</div>
		{/if}

		<button on:click={() => signOut()}>Sign Out</button>
	{:else}
		<span class="notSignedInText">You are not signed in</span>
		<button on:click={() => signIn('keycloak')}> Sign In with Keycloak</button>
	{/if}
</p>

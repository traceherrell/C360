<script>
	import { signIn, signOut } from '@auth/sveltekit/client';
	import { page } from '$app/stores';
	const assignments = $page.data.employee?.employee_assignments || [];
</script>

<h4>Surveys</h4>
<p>
	{#if $page.data.session}
		<span class="signedInText">
			<small>Signed in as</small><br />
			<strong>{$page.data.session.user?.name ?? 'User'}</strong>
		</span>

		{#if assignments.length > 0}
			{#each assignments as assignment}
				<article>
					<details>
						<summary class="none">
							<div class="row">
								<h6>{assignment.survey_groups.project_name}</h6>
								<div class="chip small tertiary round">{assignment.survey_groups.project_name}</div>
								<div class="max" />
								<i>arrow_drop_down</i>
							</div>
						</summary>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
							incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
							dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
						</p>
					</details>
				</article>
			{/each}
		{:else}
			<div>No surveys assigned</div>
		{/if}
	{:else}
		<span class="notSignedInText">You are not signed in</span>
		<button on:click={() => signIn('keycloak')}> Sign In with Keycloak</button>
	{/if}
</p>

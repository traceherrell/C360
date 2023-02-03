<script>
	import Select from 'svelte-select';
	import { invalidateAll, goto } from '$app/navigation';
	import { applyAction, deserialize } from '$app/forms';

	/** @type {import('./$types').ActionData} */

	/** @type {any} */
	let error;

	async function handleSubmit(event) {
		const data = new FormData(this);

		const response = await fetch(this.action, {
			method: 'POST',
			body: data
		});
		/** @type {import('@sveltejs/kit').ActionResult} */
		const result = deserialize(await response.text());

		if (result.type === 'success') {
			// re-run all `load` functions, following the successful update
			await invalidateAll();
			goto('/admin', { replaceState: true });
		}

		applyAction(result);
	}

	let selected = [];
	const label = 'skill';
	const itemId = 'id';

	const fetchOptions = async (filterText) => {
		const query = filterText;
		const response = await fetch(`/api/skills?q=${query}`);
		const data = await response.json();
		return data || [{ id: 1, skill: 'No results found' }];
	};
</script>

<svelte:head>
	<title>Survey Groups - New</title>
</svelte:head>

<h4>New Survey Group</h4>
<form method="post" on:submit|preventDefault={handleSubmit}>
	<div class="field label border">
		<input required type="text" name="project_name" id="project_name" />
		<label for="project_name">Project Name</label>
	</div>
	<div class="field label border">
		<input required type="text" name="opportunity_id" id="opportunity_id" />
		<label for="opportunity_id">Opportunity Id</label>
	</div>
	<div class="field label border">
		<input required type="text" name="tsm_id" id="tsm_id" />
		<label for="tsm_id">TSM Id</label>
	</div>
	<div class="field label border">
		<input required type="text" name="project_code" id="project_code" />
		<label for="project_code">Project Code</label>
	</div>
	<div class="field label border">
		<input required type="text" name="project_creator_id" id="project_creator_id" />
		<label for="project_creator_id">Project Creator Id</label>
	</div>
	<div class="themed">
		<Select
			{itemId}
			{label}
			bind:value={selected}
			name="default_skills"
			multiple
			loadOptions={fetchOptions}
			placeholder="Select default skills"
			class="field"
			required
		/>
	</div>

	<div class="row">
		<button class="button primary">Save</button>
		<div class="max" />
	</div>
</form>

<div class="modal ">
	<h5>Title</h5>
	<p>Content of modal</p>
	<nav>
		<button>Cancel</button>
		<button>Confirm</button>
	</nav>
</div>

<style>
	.themed {
		--border: 1px solid #000;
		--border-radius: 0.25em;
		--border-focused: 1px solid #000;
		--border-hover: 1px solid #000;
	}
</style>

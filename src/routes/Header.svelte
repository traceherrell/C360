<script>
	import RedHatLogo from '$lib/RedHatLogo.svelte';

	import TopAppBar, { Row, Section, Title } from '@smui/top-app-bar';
	import IconButton from '@smui/icon-button';
</script>

<TopAppBar color="primary">
	<Row>
		<Section>
			<RedHatLogo />
			<Title>Consultant 360 Feedback</Title>
		</Section>
		<Section align="end" toolbar>
			<IconButton class="material-icons" aria-label="User">account_circle</IconButton>
		</Section>
	</Row>
</TopAppBar>

import { SvelteKitAuth } from "@auth/sveltekit"
import KeyCloakProvider from "@auth/core/providers/keycloak"
import { KEYCLOAK_ID, KEYCLOAK_ISSUER } from "$env/static/private"
import type { Provider } from "@auth/core/providers"

export const handle = SvelteKitAuth({
  providers: [KeyCloakProvider({  clientId: KEYCLOAK_ID,
    clientSecret: "NA",
    issuer: KEYCLOAK_ISSUER})],
} as { providers: Provider[] })
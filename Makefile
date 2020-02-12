echo-env:
	export RELEASE_TAG=${github.event.client_payload.image_tag}
	echo "${RELEASE_TAG}"
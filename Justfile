git_sha := `git rev-parse --short HEAD 2>/dev/null || echo "unknown"`
image_name := `GIT_SHA={{git_sha}} docker buildx bake --file docker-bake.hcl --print 2>/dev/null | jq -r '.target.default.tags[0]' | cut -d: -f1`

default:
    @just --list

build:
    GIT_SHA={{git_sha}} docker buildx bake --file docker-bake.hcl

build-arm:
    GIT_SHA={{git_sha}} docker buildx bake --file docker-bake.hcl --set '*.platform=linux/arm64'

build-amd:
    GIT_SHA={{git_sha}} docker buildx bake --file docker-bake.hcl --set '*.platform=linux/amd64'

push:
    GIT_SHA={{git_sha}} docker buildx bake --file docker-bake.hcl --push

deploy:
    dokku git:from-image {{image_name}}:{{git_sha}}

release: build push deploy

debug:
    @echo "Variables:"
    @echo "  git_sha: {{git_sha}}"
    @echo "  image_name: {{image_name}}"
    @echo ""
    @echo "build command:"
    @echo "  GIT_SHA={{git_sha}} docker buildx bake --file docker-bake.hcl"
    @echo ""
    @echo "push command:"
    @echo "  GIT_SHA={{git_sha}} docker buildx bake --file docker-bake.hcl --push"
    @echo ""
    @echo "deploy command:"
    @echo "  dokku git:from-image {{image_name}}:{{git_sha}}"

variable "GIT_SHA" {
  default = ""
}

variable "IMAGE_NAME" {
  default = "registry.dokku.djbender.com/watch_keeper"
}

target "default" {
  platforms = ["linux/amd64", "linux/arm64"]
  tags = [
    "${IMAGE_NAME}:${GIT_SHA}",
    "${IMAGE_NAME}:latest"
  ]
  args = {
    GIT_SHA = "${GIT_SHA}"
  }
}

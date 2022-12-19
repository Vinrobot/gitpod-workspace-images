FROM gitpod/workspace-full

ENV RETRIGGER=3
ENV BUILDKIT_VERSION=0.10.3
ENV BUILDKIT_FILENAME=buildkit-v${BUILDKIT_VERSION}.linux-amd64.tar.gz

# Change to root
USER root

# Install dazzle, buildkit and pre-commit
RUN set -ex \
	&& curl -sSL https://github.com/moby/buildkit/releases/download/v${BUILDKIT_VERSION}/${BUILDKIT_FILENAME} | tar -xvz -C /usr \
	&& curl -sSL https://github.com/gitpod-io/dazzle/releases/download/v0.1.12/dazzle_0.1.12_Linux_x86_64.tar.gz | tar -xvz -C /usr/local/bin \
	&& curl -sSL https://github.com/mvdan/sh/releases/download/v3.5.1/shfmt_v3.5.1_linux_amd64 -o /usr/bin/shfmt \
	&& curl -sSL https://github.com/mikefarah/yq/releases/download/v4.22.1/yq_linux_amd64 -o /usr/bin/yq \
	&& chmod +x /usr/bin/shfmt /usr/bin/yq

RUN set -ex \
	&& install-packages shellcheck \
	&& pip3 install pre-commit

# Change back to gitpod
USER gitpod

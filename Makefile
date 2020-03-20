.PHONY: help test

DEFAULT_GOAL: help

test:
	mix deps.get && \
		MIX_ENV=test mix compile --warnings-as-errors && \
		MIX_ENV=dev mix compile --warnings-as-errors && \
		MIX_ENV=prod mix compile --warnings-as-errors && \
		mix credo --strict && \
		mix format --check-formatted && \
		mix dialyzer --halt-exit-status && \
		MIX_ENV=test mix test

## Shows the help menu
help:
	@echo "Please use \`make <target>' where <target> is one of\n\n"
	@awk '/^[a-zA-Z\-\_\/0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "%-30s %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

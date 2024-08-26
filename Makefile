ARGS = $(filter-out $@,$(MAKECMDGOALS))

%:
	@:

include ./makefiles/*.mk

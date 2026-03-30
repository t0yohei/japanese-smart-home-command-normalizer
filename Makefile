SKILL_NAME := japanese-smart-home-command-normalizer
PUBLISH_DIR := dist/$(SKILL_NAME)-publish

.PHONY: test publish-dir clean-publish-dir

test:
	node --test tests/normalize.test.js

publish-dir: test
	mkdir -p $(PUBLISH_DIR)
	rm -rf $(PUBLISH_DIR)/*
	cp SKILL.md $(PUBLISH_DIR)/
	cp package.json $(PUBLISH_DIR)/
	cp -R lib $(PUBLISH_DIR)/
	cp -R fixtures $(PUBLISH_DIR)/
	cp -R references $(PUBLISH_DIR)/
	cp -R scripts $(PUBLISH_DIR)/
	cp -R tests $(PUBLISH_DIR)/
	@echo "Prepared publish folder: $(PUBLISH_DIR)"

clean-publish-dir:
	rm -rf $(PUBLISH_DIR)

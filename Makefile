IMAGE = labstack/armor
VERSION = 0.4.9

run:
	go run cmd/armor/main.go

publish:
	git tag $(VERSION)
	git push origin --tags
	goreleaser --rm-dist
	docker build -t $(IMAGE):$(VERSION) -t $(IMAGE) .
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest

.PHONY: publish

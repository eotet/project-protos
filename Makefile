PROTOS  := ./proto
OUT_DIR := ./gen/go

generate:
	@mkdir -p $(OUT_DIR)
	@find $(PROTOS) -name "*.proto" | while read -r file; do \
		protoc -I $(PROTOS) "$$file" \
			--go_out=$(OUT_DIR) --go_opt=paths=source_relative \
			--go-grpc_out=$(OUT_DIR) --go-grpc_opt=paths=source_relative; \
	done

clean:
	find . -name "*.pb.go" -delete

.PHONY: deps run-fastapi run-go build-go test deploy

# Create virtual environment and install Python dependencies
deps:
	@echo "Setting up Python virtual environment..."
	python3 -m venv .venv
	@echo "Activating virtual environment and installing dependencies..."
	. .venv/bin/activate && pip install -r app/requirements.txt
	@echo "Installing Go dependencies..."
	cd internal && go mod tidy


# Run FastAPI (default port: 8000)
run-fastapi:
	@echo "Starting FastAPI server..."
	cd app && uvicorn main:app --host 0.0.0.0 --port 8000 --reload

# Run Go WebSocket server (default port: 8080)
run-go:
	@echo "Starting Go WebSocket server..."
	cd cmd/server && go run main.go

# Build Go WebSocket server
build-go:
	@echo "Building Go server..."
	cd cmd/server && go build -o websocket_server main.go

# Run all tests
test:
	@echo "Running Python tests..."
	cd app/tests && pytest
	@echo "Running Go tests..."
	cd internal && go test ./...

# Deploy to Kubernetes
deploy:
	@echo "Deploying to Kubernetes..."
	kubectl apply -f deployments/templates/fastapi/test-pod.yaml

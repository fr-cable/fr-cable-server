require "sentry"

sentry = Sentry::ProcessRunner.new(
  display_name: "My cool app",
  build_command: "crystal build ./src/run.cr",
  run_command: "./run",
  files: ["./src/**/*.cr", "./src/**/*.ecr"]
)

sentry.run
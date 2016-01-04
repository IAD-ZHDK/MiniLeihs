rackup DefaultRackup
environment ENV['RACK_ENV'] || 'development'
prune_bundler

workers Integer(ENV['PUMA_WORKERS'] || 2)
threads Integer(ENV['MIN_THREADS'] || 1), Integer(ENV['MAX_THREADS'] || 16)

bind "tcp://0.0.0.0:#{ENV['PORT'] || 3000}"

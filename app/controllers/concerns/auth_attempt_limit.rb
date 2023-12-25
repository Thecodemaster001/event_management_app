# frozen_string_literal: true

# Throttles `POST /login` and `POST /signup` per client IP, so a password can
# not be guessed, nor accounts mass-created, at full request speed.
#
# The counters live in this process's memory rather than Rails.cache: the API
# runs as a single Puma process, the test environment's cache is a null store
# (which would make the limit untestable), and losing the counters on restart
# is harmless. Running several API processes behind a balancer would need a
# shared store here instead.
module AuthAttemptLimit
  extend ActiveSupport::Concern

  ATTEMPTS = 10
  WINDOW = 3.minutes
  STORE = ActiveSupport::Cache::MemoryStore.new

  included do
    rate_limit to: ATTEMPTS, within: WINDOW, only: :create, store: STORE,
               with: -> { render json: { errors: [I18n.t('errors.too_many_attempts')] }, status: :too_many_requests }
  end
end

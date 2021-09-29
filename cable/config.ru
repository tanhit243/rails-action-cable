# frozen_string_literal: true

require_relative '../config/environment'

run Rails.application
run ActionCable.server

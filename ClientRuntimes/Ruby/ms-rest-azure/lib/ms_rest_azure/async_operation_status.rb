# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

module MsRestAzure
  #
  # Defines values for AsyncOperationStatus enum.
  #
  class AsyncOperationStatus
    IN_PROGRESS_STATUS = "InProgress"
    SUCCESS_STATUS = "Succeeded"
    FAILED_STATUS = "Failed"
    CANCELED_STATUS = "Canceled"

    ALL_STATUSES = [FAILED_STATUS, CANCELED_STATUS, SUCCESS_STATUS, IN_PROGRESS_STATUS]
    FAILED_STATUSES = [FAILED_STATUS, CANCELED_STATUS]
    TERMINAL_STATUSES = [FAILED_STATUS, CANCELED_STATUS, SUCCESS_STATUS]

    DEFAULT_DELAY = 30

    # @return [Integer] delay in seconds which should be used for polling for result of async operation.
    attr_accessor :retry_after

    # @return [MsRestAzure::AzureOperationError] error information about async operation.
    attr_accessor :error

    # @return [Stirng] status of polling.
    attr_accessor :status

    #
    # Checks if given status is terminal one.
    # @param status [String] status to verify
    #
    # @return [Boolean] True if given status is terminal one, false otherwise.
    def self.is_terminal_status(status)
      TERMINAL_STATUSES.any? { |st| st == status }
    end

    #
    # Checks if given status is failed one.
    # @param status [String] status to verify
    #
    # @return [Boolean] True if given status is failed one, false otherwise.
    def self.is_failed_status(status)
      FAILED_STATUSES.any? { |st| st == status }
    end

    #
    # Checks if given status is successful one.
    # @param status [String] status to verify
    #
    # @return [Boolean] True if given status is successful one, false otherwise.
    def self.is_successful_status(status)
      return status == SUCCESS_STATUS
    end

    #
    # Deserializes given hash into AsyncOperationStatus object.
    # @param object [Hash] object to deserialize.
    #
    # @return [AsyncOperationStatus] deserialized object.
    def self.deserialize_object(object)
      return if object.nil?
      output_object = AsyncOperationStatus.new

      fail AzureOperationError, 'Invalid status was recieved during polling' unless ALL_STATUSES.include?(object['status'])
      output_object.status = object['status']

      output_object.error = CloudErrorData.deserialize_object(object['error'])

      output_object.retry_after = Integer.new(object['retryAfter']) unless object['retryAfter'].nil?

      output_object
    end
  end

end
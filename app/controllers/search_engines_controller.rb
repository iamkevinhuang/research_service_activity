class SearchEnginesController < ApplicationController

  def show
    @id = params[:id]
    @signature_container = SignatureContainer.find_by_sha_id @id
    @signature_container.compile! if @signature_container
  end

end

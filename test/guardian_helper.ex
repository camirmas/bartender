defmodule GuardianHelper do
  use Guardian, otp_app: :bartender

  def subject_for_token(resource, _claims) do
    {:ok, resource.id}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    if id == "ok" do
      {:ok,  %{test: true}}
    else
      {:error, "Not found"}
    end
  end
end

defmodule AuthWeb.Helpers.HeadersHelper do
  # Aliases
  alias Auth.Authenticator

  def get_auth_token(conn) do
    case extract_token(conn) do
      {:ok, token} -> Authenticator.verify_token(token)
      error -> error
    end
  end

  defp extract_token(conn) do
    case Plug.Conn.get_req_header(conn, "authorization") do
      [auth_header] -> get_token_from_header(auth_header)
      _ -> {:error, :missing_auth_header}
    end
  end

  defp get_token_from_header(auth_header) do
    {:ok, reg} = Regex.compile("Bearer\:?\s+(.*)$", "i")
    case Regex.run(reg, auth_header) do
      [_, match] -> {:ok, String.trim(match)}
      _ -> {:error, :not_found}
    end
  end
end

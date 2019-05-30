defmodule Server.CompagniesTest do
  use Server.DataCase

  alias Server.Compagnies

  describe "agencies" do
    alias Server.Compagnies.Agency

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def agency_fixture(attrs \\ %{}) do
      {:ok, agency} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Compagnies.create_agency()

      agency
    end

    test "list_agencies/0 returns all agencies" do
      agency = agency_fixture()
      assert Compagnies.list_agencies() == [agency]
    end

    test "get_agency!/1 returns the agency with given id" do
      agency = agency_fixture()
      assert Compagnies.get_agency!(agency.id) == agency
    end

    test "create_agency/1 with valid data creates a agency" do
      assert {:ok, %Agency{} = agency} = Compagnies.create_agency(@valid_attrs)
      assert agency.name == "some name"
    end

    test "create_agency/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Compagnies.create_agency(@invalid_attrs)
    end

    test "update_agency/2 with valid data updates the agency" do
      agency = agency_fixture()
      assert {:ok, %Agency{} = agency} = Compagnies.update_agency(agency, @update_attrs)
      assert agency.name == "some updated name"
    end

    test "update_agency/2 with invalid data returns error changeset" do
      agency = agency_fixture()
      assert {:error, %Ecto.Changeset{}} = Compagnies.update_agency(agency, @invalid_attrs)
      assert agency == Compagnies.get_agency!(agency.id)
    end

    test "delete_agency/1 deletes the agency" do
      agency = agency_fixture()
      assert {:ok, %Agency{}} = Compagnies.delete_agency(agency)
      assert_raise Ecto.NoResultsError, fn -> Compagnies.get_agency!(agency.id) end
    end

    test "change_agency/1 returns a agency changeset" do
      agency = agency_fixture()
      assert %Ecto.Changeset{} = Compagnies.change_agency(agency)
    end
  end
end

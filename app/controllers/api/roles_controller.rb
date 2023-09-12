# frozen_string_literal: true

module Api
  class RolesController < ApplicationController
    def create
      @role = Role.new(role_params)
      if @role.save
        render json: @role, status: :created
      else
        render json: @role.errors, status: :unprocessable_entity
      end
    end

    def assign_role
      user_id = params[:user_id]
      team_id = params[:team_id]
      role_id = params[:role_id]

      unless user_id && team_id && role_id
        render json: { error: 'Missing user_id, team_id, or role_id' }, status: :bad_request
        return
      end

      user = User.find_by(id: user_id)
      team = Team.find_by(id: team_id)
      role = Role.find_by(id: role_id)

      unless user && team && role
        render json: { error: 'User, team, or role not found' }, status: :not_found
        return
      end

      if user && team && role
        membership = Membership.find_or_initialize_by(user: user, team: team)
        membership.role = role

        if membership.save
          render json: membership, status: :created
        else
          render json: membership.errors, status: :unprocessable_entity
        end
      else
        render json: { error: 'User, team, or role not found' }, status: :not_found
      end
    end

    def lookup_role
      @membership = Membership.find_by(user_id: params[:user_id], team_id: params[:team_id])
      if @membership
        @role = @membership.role
        render json: @role
      else
        render json: { error: "Membership not found" }, status: :not_found
      end
    end

    def lookup_memberships
      @role = Role.find(params[:role_id])
      @memberships = @role.memberships
      render json: @memberships
    end

    private

    def role_params
      params.require(:role).permit(:name)
    end
  end
end

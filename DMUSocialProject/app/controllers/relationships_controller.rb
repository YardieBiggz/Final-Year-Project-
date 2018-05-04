class RelationshipsController < ApplicationController
# This creats a new following relation then redirect to back
    def create
        user = User.find(params[:followed_id])
        current_user.follow(user)
        redirect_to(:back)
    end
# this does the same which destroy that relationship if someone clicks unfollow
    def destroy
        user = Relationship.find(params[:id]).followed
        current_user.unfollow(user)
        redirect_to(:back)
    end

end

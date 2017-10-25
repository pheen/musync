class GroupChannel < ApplicationCable::Channel
  def subscribed
    group = Group.find(params[:id])
    stream_for group
  end

  def receive(data)
    group = Group.find(params[:id]) # TODO: do something better
    attrs = {
      index: data['index'],
      position: data['position']
    }

    if current_user && current_user.id == group.owner_id
      self.class.broadcast_to(group, attrs)
    end

    # group.update_attributes(attrs)
  end
end

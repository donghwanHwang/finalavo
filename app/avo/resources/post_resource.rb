class PostResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  self.search_query = -> do
   scope.ransack(id_eq: params[:q],title_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text
  field :body, as: :trix
  # add fields here
end

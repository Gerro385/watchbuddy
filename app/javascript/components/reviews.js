function createReview() {

  const rateBtn = document.getElementByClass("ratebtn");

  const createReview = rateBtn.addEventListener("click", (event) => {
    event.preventDefault(); // <-- to prevent <form>'s native behaviour
    const review = `<div class="row mt-3 mb-3">
        <%# if @review %>
        <% if @medium.watches %>
          <% @medium.watches.each do |watch| %>
            <% if watch.description %>
              <div class="card-review col-4 mt-3 mb-3 mr-4 ml-3">
                <div class="text">
                  <div class="rating"><img src="https://res.cloudinary.com/g385/image/upload/v1598863329/Pictograms/star-filled.png" alt="star"> <%= watch.rating %></div>
                  <p ><i>"<%= watch.description %>"</i></p>
                  <div class="name"><%= watch.user.first_name + " " + watch.user.last_name %></div>

                  <img class="avatar" src="
                  <% if current_user.photo.blank? %>
                    https://clipartart.com/images/login-background-images-clipart-1.jpg
                  <% else %>
                  <%= cl_image_path current_user.photo.key, width: 50, height: 50, crop: :thumb, gravity: :face %>
                  <% end %>
                  " />
                </div>
              </div>
            <% end %>
          <% end %>
        <% end %>
        </div>`;
          results.insertAdjacentHTML("beforeend", review);
    results.innerHTML = '';
  });
}
export { createReview };

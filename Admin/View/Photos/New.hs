module Admin.View.Photos.New where
import Admin.View.Prelude

data NewView = NewView { photo :: Photo }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PhotosAction}>Photos</a></li>
                <li class="breadcrumb-item active">New Photo</li>
            </ol>
        </nav>
        <h1>New Photo</h1>
        <div style="max-width: 300px">
                        <div class="form-group">
                            <label for="user_picture_url">
                                <img id="user_picture_url_preview" style="width: 12rem; min-height: 12rem; min-width: 12rem; background-size: cover" class="mt-2 img-thumbnail text-center text-muted" alt="Preview"/>
                                <input id="user_picture_url" type="file" name="pictureUrl" class="form-control form-control-file" style="display: none" data-preview="#user_picture_url_preview" />
                                <a class="d-block text-muted text-center" href="#" onclick="document.getElementById('user_picture_url').click()">Upload</a>
                            </label>
                        </div>
                    </div>
        {renderForm photo}
    |]

renderForm :: Photo -> Html
renderForm photo = formFor photo [hsx|
    {(textField #filename)}
    {(textField #width)}
    {(textField #height)}
    {(checkboxField #isActive)}
    {submitButton}
|]

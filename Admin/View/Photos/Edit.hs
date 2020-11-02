module Admin.View.Photos.Edit where
import Admin.View.Prelude

data EditView = EditView { photo :: Photo }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PhotosAction}>Photos</a></li>
                <li class="breadcrumb-item active">Edit Photo</li>
            </ol>
        </nav>
        <h1>Edit Photo</h1>
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

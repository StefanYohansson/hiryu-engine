module Admin.View.Photos.Index where
import Admin.View.Prelude

data IndexView = IndexView { photos :: [Photo] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={PhotosAction}>Photos</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewPhotoAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Photo</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach photos renderPhoto}</tbody>
            </table>
        </div>
    |]


renderPhoto photo = [hsx|
    <tr>
        <td>{photo}</td>
        <td><a href={ShowPhotoAction (get #id photo)}>Show</a></td>
        <td><a href={EditPhotoAction (get #id photo)} class="text-muted">Edit</a></td>
        <td><a href={DeletePhotoAction (get #id photo)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]

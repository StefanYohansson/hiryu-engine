module Admin.View.Photos.Show where
import Admin.View.Prelude

data ShowView = ShowView { photo :: Photo }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PhotosAction}>Photos</a></li>
                <li class="breadcrumb-item active">Show Photo</li>
            </ol>
        </nav>
        <h1>Show Photo</h1>
        <p>{photo}</p>
    |]

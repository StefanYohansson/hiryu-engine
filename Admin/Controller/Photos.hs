module Admin.Controller.Photos where

import Admin.Controller.Prelude
import Admin.View.Photos.Index
import Admin.View.Photos.New
import Admin.View.Photos.Edit
import Admin.View.Photos.Show

instance Controller PhotosController where
    action PhotosAction = do
        photos <- query @Photo |> fetch
        render IndexView { .. }

    action NewPhotoAction = do
        let photo = newRecord
        render NewView { .. }

    action ShowPhotoAction { photoId } = do
        photo <- fetch photoId
        render ShowView { .. }

    action EditPhotoAction { photoId } = do
        photo <- fetch photoId
        render EditView { .. }

    action UpdatePhotoAction { photoId } = do
        photo <- fetch photoId
        photo
            |> buildPhoto
            |> ifValid \case
                Left photo -> render EditView { .. }
                Right photo -> do
                    photo <- photo |> updateRecord
                    setSuccessMessage "Photo updated"
                    redirectTo EditPhotoAction { .. }

    action CreatePhotoAction = do
        let photo = newRecord @Photo
        photo
            |> buildPhoto
            |> ifValid \case
                Left photo -> render NewView { .. } 
                Right photo -> do
                    photo <- photo |> createRecord
                    setSuccessMessage "Photo created"
                    redirectTo PhotosAction

    action DeletePhotoAction { photoId } = do
        photo <- fetch photoId
        deleteRecord photo
        setSuccessMessage "Photo deleted"
        redirectTo PhotosAction

buildPhoto photo = photo
    |> fill @["filename","width","height","isActive"]

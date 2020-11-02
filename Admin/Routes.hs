module Admin.Routes where
import IHP.RouterPrelude
import Generated.Types
import Admin.Types

-- Generator Marker
instance AutoRoute SessionsController
instance AutoRoute UsersController
type instance ModelControllerMap AdminApplication User = UsersController

instance AutoRoute AdminsController
type instance ModelControllerMap AdminApplication Admin = AdminsController

instance AutoRoute PhotosController
type instance ModelControllerMap AdminApplication Photo = PhotosController


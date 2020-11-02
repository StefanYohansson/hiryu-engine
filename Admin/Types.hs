module Admin.Types where
import IHP.Prelude
import qualified IHP.Controller.Session
import qualified IHP.ControllerSupport as ControllerSupport
import IHP.ModelSupport
import Application.Helper.Controller
import IHP.ViewSupport
import Generated.Types
import IHP.LoginSupport.Types

data AdminApplication = AdminApplication deriving (Eq, Show)

instance HasNewSessionUrl Admin where
    newSessionUrl _ = "/admin/NewSession"

data ViewContext = ViewContext
    { requestContext :: ControllerSupport.RequestContext
    , flashMessages :: [IHP.Controller.Session.FlashMessage]
    , controllerContext :: ControllerSupport.ControllerContext
    , layout :: Layout
    , user :: Maybe Admin
    }

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)


data UsersController
    = UsersAction
    | NewUserAction
    | ShowUserAction { userId :: !(Id User) }
    | CreateUserAction
    | EditUserAction { userId :: !(Id User) }
    | UpdateUserAction { userId :: !(Id User) }
    | DeleteUserAction { userId :: !(Id User) }
    deriving (Eq, Show, Data)

data AdminsController
    = AdminsAction
    | NewAdminAction
    | ShowAdminAction { adminId :: !(Id Admin) }
    | CreateAdminAction
    | EditAdminAction { adminId :: !(Id Admin) }
    | UpdateAdminAction { adminId :: !(Id Admin) }
    | DeleteAdminAction { adminId :: !(Id Admin) }
    deriving (Eq, Show, Data)

data PhotosController
    = PhotosAction
    | NewPhotoAction
    | ShowPhotoAction { photoId :: !(Id Photo) }
    | CreatePhotoAction
    | EditPhotoAction { photoId :: !(Id Photo) }
    | UpdatePhotoAction { photoId :: !(Id Photo) }
    | DeletePhotoAction { photoId :: !(Id Photo) }
    deriving (Eq, Show, Data)

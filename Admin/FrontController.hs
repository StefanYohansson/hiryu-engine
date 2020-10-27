module Admin.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Admin.Types
import IHP.LoginSupport.Middleware
import Admin.Controller.Sessions

-- Controller Imports
import Admin.Controller.Users
import IHP.Welcome.Controller

instance FrontController AdminApplication where
    controllers = 
        [ startPage WelcomeAction
        , parseRoute @SessionsController
        -- Generator Marker
        , parseRoute @UsersController
        ]

instance InitControllerContext AdminApplication where
    initContext =
        initAuthentication @User

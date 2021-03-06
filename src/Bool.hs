module Bool
    (
      Variable(..)
    , Value(..)
    , Literal(..)

    , newLit
    , coversValue

    ) where


-- | A boolean variable.
newtype Variable = Variable String
    deriving (Eq, Ord)

-- | A value which can be given to a boolean variable.
-- The values T, F, and X denote true, false and don't
-- care, respectively.
data Value = F | X | T
    deriving (Show, Enum, Eq, Ord)

-- | A boolean variable with an associated value.
data Literal = Literal Variable Value
    deriving (Eq, Ord)

instance Show Variable where
  show (Variable v) = v

-- | Positive, Negative and Don't Care literals have the
-- variable name prefixed with '+', '~' and '-', respectively.
instance Show Literal where
    show (Literal var val) =
        case val of
            T -> '+' : show var
            F -> '~' : show var
            X -> 'x' : show var

newLit :: String -> Value -> Literal
newLit v = Literal (Variable v)

coversValue :: Value -> Value -> Bool
coversValue X _ = True
coversValue x y = x == y

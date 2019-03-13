function Get-ClearTextPW
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [SecureString]$Password
    )

    $BSTR = [ System.Runtime.InteropServices.Marshal ]::SecureStringToBSTR( $Password )
    $return_password = [ System.Runtime.InteropServices.Marshal ]::PtrToStringAuto( $BSTR )
    # https://docs.microsoft.com/en-us/dotnet/api/system.runtime.interopservices.marshal.zerofreebstr?view=netframework-4.7.2
    [ System.Runtime.InteropServices.Marshal ]::ZeroFreeBSTR( $BSTR )

    $return_password
}
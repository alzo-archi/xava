defmodule Xava.Keys do
  @jdks %{
    21 => """
    -----BEGIN PGP PUBLIC KEY BLOCK-----
    Version: GnuPG v2.0.22 (GNU/Linux)

    mQINBF3pShkBEADJzglehQDFlc1+9VFubVPzpq8ZYtzmJkNjf09scOUzaKZOm3Ar
    mPh9Rufk4mB7t1LP4JeHAKAS17ggCHGVxRGXAAQ9Laf8ibX4SiFO3Ehyyl3smuFf
    ZhexBnvc7vRc4EUlKqarCQRUlaraDOrmq7WbhXdvCgc4u2uBLwUjAd3PHQUByAZw
    lsEQzpQnehNomjrE0pO6ms9AhmpbXlf/yr14EXvlo4lTd8QUdvS+AOCYfrHb9WGO
    IEsyyDuzuf2grV/QFpoi0VBhTCyiNYXla2AfCreMGlOCYsjw1nU93OyAqF3SaTOC
    o52yrzcb2NpbBDwRXOHNwe1md+DbRwEfkaWr5I91FqRpgEeawqyxY1miJRHduhsz
    WTgTMBF/EQfmTspD2YBX/BjNJTrdDXYvACX8slVV/vBnpi+dEpVEK3hh21ij991S
    lv8YoFnoC7XP44C7WNpVQpGW9ZWpnjLCvm3DMKW0r3Vfb3XDYhnHI1Q14Pxn0cwf
    x1L2RA4doyWd1TRZBFBe2f0vSkZT0YFaibKaKi6AkDIMU/+u+/e3wWbYXqzsSITj
    ffMkpMMNSwxbm8JqnsudjuzdEsYAiBUcFMwWysQDcyu63un2OmLKLfKxy19vCpS1
    8mkNy95JuO4jZtu+IiinvSSjlbJmslu3uK3/cTRsWaB7BRtHewE7SugMOwARAQAB
    tEhBbWF6b24gU2VydmljZXMgTExDIChBbWF6b24gQ29ycmV0dG8gcmVsZWFzZSkg
    PGNvcnJldHRvLXRlYW1AYW1hem9uLmNvbT6JAjEEEwECABsFAl3pShkCGy8FCQlm
    AYAFFQgKCQsCHgECF4AACgkQoSJUKrBPJOOJDg/6AqmntaxDWX6qfR++0qwtD9Lp
    vgONFvA+9AYQeGt7OX79O/SSPy97Kvn6DYRBdelShTAH60DbXCUs42sIRFqRjmHY
    HfIgOkUJjWoJz9oQnY+mzAKbOohCrR+YIvyCegFb0dboDaqSQ4w68+d1is7L84pz
    ZB2j0nrQDbFihPmR+epfHkLUGGywuZHCdEFfD8nXMOJeVbgSzf7Vhl8ZrydIkZTI
    7aASG5MkDO/GuVpEGQYAnH9h/jzJlfUKndswC6UFcM5Ol07pDPdHVBAi9q1SyxDe
    uSS1NgDW7OW7zgpB+4/PrZKKiEP/fBAWa9nFSLwTaMdsoaAuQAmmgbqYfy3XXKK7
    IBaKSnJpQDvNb0vmXJEY3qX2Bfh0p1KCeaQhYwIJi8rPQWC24fiLY9bdCIlkbbPQ
    CSNOEq9nUWRg9KbUGmd/PWSkT6Jheyq3BZBF1YPYEt8o/l437HHd08lREqH0sana
    Hb72GZTi2RUrNBBp5C1e8MqllXE6RKmri2m0TSBHR5C4ZLII9duyA839dYIA4KGU
    nmetZckuRuwHFmd3/YWtMEfn47UedzhVT16z3OvBipHU1BKzLGcvUFXrUKvpJQlh
    dNPUQh+wb91EzItjkJ96m+N+81iQdN3yd8cE38NTA8b+Qc7tmTYxwNZxcv16FxLA
    y2VhKc09A8RwSI69vDs=
    =ZNRH
    -----END PGP PUBLIC KEY BLOCK-----
    """
  }

  def get_pubkey(vsn) do
    @jdks[vsn]
  end
end

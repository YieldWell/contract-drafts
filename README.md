not sure how scaffold-eth works, so i'm just gonna start coding contracts using truffle framework for now. we can delete this repo and move the files over to the actual repo when necessary

## My interpretation on contracts Tomo posted
### PoolFactory.sol
On the platform we will have Pools. This leads naturally to creating
some sorta "PoolFactory" which handles the creation and tracking
of all the pools on the platform.

Pools must have an ApprovedStrat and an ApprovedRecipient. The strat
is the underlying (88mph) pool that the funds will be depositing to
to earn yield. The recipient is the charity organization that ultimately receives the yield. Both must be whitelisted for security purposes (?). Thus, the pool gets its strat and recipient from approved lists, which are maintained by the Whitelist.sol contract.

### ApprovedStrat.sol
Users must be able to deposit funds into the pools. This contract takes the funds and deposits them in the
approved strat. This contract is also responsible for withdrawing the funds. In my mind, it seems like the "middleman"
contract of our platform, ie, handling transactions between pools and underlying 88mph strat., as well as between
pools and recipient.

### ApprovedRecipient.sol
This contract is responsible for allowing recipients to withdraw their funds from the pool when possible.

### Whitelist.sol
This contract maintains a list of the whitelisted strats and recipients of the platform. It also allows users
to update these lists (based on some sort of vote)

This is what I'm imagining the flow to be like between different entities and end-users. Each arrow is an interaction,
and thus calls for a smart contract, which I put the contract above/below it that I think handles that interface.

&ensp;&ensp;&ensp;ApprovedStrat &ensp;&ensp;&ensp;&ensp;&ensp;ApprovedStrat
donater => pool => 88mph-strat => pool => recipient
&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;ApprovedStrat &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;ApprovedRecipient

Whitelist - maintains approved strats and recipients that other contracts reference
PoolFactory - maintains list of pools on platform

## Further questions
- Does charity just receive the yield or the principal amount as well?
- If it is just yield, and since 88mph is stable-interest, won't this
result in low yield for charities?
- In terms of p2p microlending, this wouldn't really be microlending,
since the user is not receiving principal back, but donating it to the
charity, which does the microlending. I'm cool with that, but wanted
to make sure we're all on the same page.

## Other thoughts
- Not sure how easy voting is to implement? Maybe just leave it out in interest of time and say that in real-world
implementation we would have voting, but for now, all users have "root" privilenges.
- Referring to above diagram...ApprovedStrat handles (3) interfaces, and I think that logically it makes sense
that it only handles the "intermediate" interfaces of the pool <==> strat interaction, not any interaction with
end-user. So perhaps we can implement proxy functions in PoolFactory, which the user calls, and then that deposits
into pool, which then calls ApprovedStrat function to deposit to strat.
- I think the contract names are a bit confusing, especially with ApprovedStrat/ApprovedRecipient. Or I may be totally
interpreting their meaning incorrectly xD
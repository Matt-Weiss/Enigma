## Self Assessment:

#### Functionality:
 Solid 3. I believe that everything works correctly and it hasn't broken yet. I will start on the crack method, but I haven't yet been able to visualize how to reverse engineer the key, despite the shifts being relatively easy to figure out.

#### Object Oriented Programming:
I think this is a 3. I'm glad that I decided to nix the decrypt module and spend some time refactoring encrypt to make it dual purpose. This made ticking the box for the fourth class a bit of a conundrum, but the runner filled the gap nicely. I'd like to refactor my single 9 line method in the encrypt_module, but I'm not sure how to do it while maintaining readability. I think my variable names likely still need work, I feel I'm still struggling to walk the fine line between keeping them descriptive and keeping them short enough to not clutter up my methods.

#### Test Driven Development:
I did okay here, another 3. I concentrated on unit tests since that was a weak spot in the cross_check project, even including an argument in the Enigma init method to let me test the encrypt_message method more thoroughly. I'd definitely like feedback on what should be tested in the runner file, if anything.

#### Version Control:
If I'm being honest, this currently sits at a 2. Working on the crack will get me to the right number of commits and maybe 10 PRs, but I definitely need to get better about committing more often. Even while concentrating on it I found myself charging ahead on related items without committing often enough. I ended up with only 19 methods in the whole project (plus the encrypt/decrypt.rb files), so I really needed to commit after each method and test to tick all the boxes here.

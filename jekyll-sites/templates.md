For different templates, they have different commands, follow their docs for better experience. 

### For al-folio template
**[Al-folio template](https://github.com/alshedivat/al-folio)**
1. Install jekylly with ruby-3.1.0 or greater. Follow this: https://jekyllrb.com/
2. If getting error then follow my doc `profile-jekyll+react.md`
3. Now, do following to get the pages,
At first, while committing, I will need to checkout to `gh-pages` but later I can use master. It worked that way for me.
```
git init
git checkout -b gh-pages
# general commands for github
```
Follow these videos if stuck,
[video 1](https://www.youtube.com/watch?v=g6AJ9qPPoyc&t=267s)
[video 2](https://www.youtube.com/watch?v=fqFjuX4VZmU)

After changing the source code, do following,
```
# commit to github in a general way first, then do this, without following the code will not be deployed properly.
bin/deploy --user
```
Now, wait for the deployment, after it's done, you should be able to see the updated page on the link present in `settings/pages`.
Do this to see the updated site on local machine,
```
bundle exec jekyll serve --lsi
```
The website will be visible here: [localhost:4000](http://localhost:4000) 
If in the config file, the `baseurl` is set then it should be [localhost:4000/<baseurl value>](http://localhost:4000/baseurl-value)

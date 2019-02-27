# DOdiscourse
shell script to configure an SSL ready discourse droplet at digitalocean

To create an instance of discourse at digitalocean, I basically followed their instruction at https://www.digitalocean.com/docs/one-clicks/discourse/
This includes a (heavily suggested) section about "Enabling HTTPS" with two links to discourse instructions, I used the "basic one", suggested by the discourse team: https://meta.discourse.org/t/setting-up-https-support-with-lets-encrypt/40709
Step 4 of this is rebuilding the container, which led straight and reproducible to crashes while rebuilding the app. It took me a while to understand this was caused by a lack of memory and when I did, adding swap solved the problem.

I now wrote a shell script remotely accessing the droplet, adding swap, disabling digitaloceans own discourse setup script that is run on every ssh login until it is finished. Instead my script will, after adding swap, start the original discourse setup script (because it includes the SSL setup, even without having to edit the app.yml) and ends with (successfully) rebuilding the app.

After finishing there should be a ready-to-use discourse instance. Also not one click, but definitely more comfortable setup.

Before executing the script, be sure to
1. create the discourse oneclick droplet at digitalocean and find its IP
2. have a (sub-) domain pointing at the droplets IP(s)
3. have an smtp mail server ready
4. (optional) throw a preconfigured discourse app.yml into this directory
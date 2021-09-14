!/bin/bash
sublist3r -d [domain.com] -o cikti10.txt
subfinder -d [domain.com] >> cikti10.txt
./assetfinder -subs-only [domain.com] >> cikti10.txt
cat cikti10.txt | sort -u > ciktison.txt
cat ciktison.txt | tr "<BR>" "\n" >> ciktison1.txt
cat ciktison1.txt | sort -u >> ciktison2.txt
wc -l ciktison2.txt
cat ciktison2.txt | sed 's/$/<br>/' > Subdomains.html
cat ciktison2.txt | ./httprobe > probesubdomains.txt
./Takeover -f probesubdomains.txt -v > takeoverapor.txt
declare -i zy=`grep -cv 'mVulnerable' takeoverapor.txt `
echo $zy Not Vulnerable >> Subdomain-Takeover.html
declare -i zys=`grep -cv 'mNot Vulnerable' takeoverapor.txt `
echo $zys Vulnerable >> Subdomain-Takeover.html
cat takeoverapor.txt | sed 's/$/<br>/' >> Subdomain-Takeover.html
nmap -sS -oA rapor.txt --open -iL ciktison2.txt -v
cat rapor.txt.nmap | sed 's/$/<br>/' > Nmap-Rapor.html
cat ciktison2.txt | ./aquatone
declare -i x = grep Not Vulnerable Subdomain-Takeover.html >> Takesonuc1.txt
wc -l takeoverapor.txt >> Takesonuc1.txt
cat Takesonuc1.txt >> Subdomain-Takeover.html

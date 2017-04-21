PATH=$PATH:/usr/local/bin

enc() {
  echo "$1" | sed -e 's/&/\&amp;/g' -e 's/>/\&gt;/g' -e 's/</\&lt;/g' -e "s/'/\&apos;/g" -e 's/"/\&quot;/g'
}
echo "<?xml version='1.0'?><items>"
for i in $(ghq list -p | grep -i '{query}')
do
   name=$(enc "$i")
   repo=$(echo "$name" | awk -F'/' '{print $NF}')
   echo "<item uid='$name' arg='$name' valid='yes' autocomplete='autocomplete'><title>$repo</title><subtitle>$name</subtitle><icon>icon.png</icon></item>"
done
echo "</items>"


# Add each topic folder to fpath
# so that they can add functions and completion scripts
for topic_folder ($DOT_HOME/*); do
  if [ -d $topic_folder ]; then
    fpath=($topic_folder $fpath)
  fi
done
fpath=("$ZSH/functions" $fpath)
autoload -U $ZSH/functions/*(:t)

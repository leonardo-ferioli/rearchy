# Copy over Omarchy configs
mkdir -p ~/.config
cp -R $OMARCHY_PATH/config/* ~/.config/

# Use default bashrc from Omarchy
cp $OMARCHY_PATH/default/bashrc ~/.bashrc

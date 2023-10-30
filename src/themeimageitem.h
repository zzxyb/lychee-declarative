#ifndef THEMEIMAGEITEM_H
#define THEMEIMAGEITEM_H

#include "declarativeglobal.h"

#include <QQuickItem>

class ThemeImageItemPrivate;

/**
 * @brief The ThemeImageItem class pictures can be processed according to theme changes,
 * e.g. black for light theme, white for dark theme.the processed result is displayed
 * by item.
 */
class LYCHEE_DECLARATIVE_EXPORT ThemeImageItem : public QQuickItem
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit ThemeImageItem(QQuickItem *parent=nullptr);

protected:
    ThemeImageItem(ThemeImageItemPrivate &dd, QQuickItem *parent);

private:
    Q_DECLARE_PRIVATE(ThemeImageItem)
    Q_DISABLE_COPY(ThemeImageItem)
};

#endif // THEMEIMAGEITEM_H
